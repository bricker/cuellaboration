AppConfig = Rails.env == "production" ? ENV : YAML.load_file(File.join(Rails.root, "config", "app_config.yml"))
