require 'simplecov'
SimpleCov.start do
	add_filter "/config/"
	add_filter "/spec/"

	add_group "Models", "app/models"
	add_group "Controllers", "app/controllers"

end
