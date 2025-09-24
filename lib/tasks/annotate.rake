# lib/tasks/manual_annotate.rake

namespace :manual_annotate do
  desc "Annotate Gemfile with short gem descriptions (overwrite existing comments)"
  task gemfile: :environment do
    gemfile = Rails.root.join("Gemfile")

    unless File.exist?(gemfile)
      puts "⚠️ Gemfile not found"
      next
    end

    descriptions = {}
    Gem::Specification.each do |spec|
      descriptions[spec.name] = spec.summary&.strip || spec.description&.strip || "N/A"
    end

    annotated = []
    File.readlines(gemfile).each do |line|
      if line =~ /^\s*gem\s+['"]([^'"]+)['"]/
        gem_name = $1
        summary = descriptions[gem_name]
        clean_line = line.sub(/#.*$/, "").rstrip

        if summary && !summary.empty?
          annotated << clean_line + "  # #{summary}\n"
        else
          annotated << clean_line + "\n"
        end
      else
        annotated << line
      end
    end

    File.write(gemfile, annotated.join)
    puts "✅ Gemfile annotated with gem descriptions"
  end

  desc "Annotate models with schema information from db/schema.rb (at the bottom of the file)"
  task models: :environment do
    schema_file = Rails.root.join("db", "schema.rb")
    unless File.exist?(schema_file)
      puts "⚠️ No schema file found"
      next
    end

    schema = File.read(schema_file)
    models = Dir[Rails.root.join("app", "models", "**", "*.rb")]

    models.each do |model_file|
      model_name = File.basename(model_file, ".rb").camelize
      table_name = model_name.underscore.pluralize

      table_block = schema[/create_table "#{table_name}".*?end/m]
      next unless table_block

      header = [ "# == Schema Information", "# Table name: #{table_name}" ]
      table_block.scan(/t\.(\w+)\s+"(\w+)".*/).each do |type, column|
        header << "#  #{column}: #{type}"
      end
      header_text = "\n\n" + header.join("\n") + "\n"

      body = File.read(model_file)

      # Remove existing schema block (at the end or anywhere)
      body.sub!(/\n# == Schema Information.*\z/m, "")

      # Append schema info at the bottom
      new_body = body.rstrip + header_text
      File.write(model_file, new_body)

      puts "✅ Annotated #{model_file} (schema at bottom)"
    end
  end

  desc "Annotate both Gemfile and models"
  task all: [ :gemfile, :models ]
end
