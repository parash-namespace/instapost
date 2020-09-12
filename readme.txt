Cloudinary setup :
	
	active_storage:install
	migrate

	Gem cloudinary
	cloudinary.rb in initializers
	storage.yml define cloudinary
	in config environments - active_storage :cloudinary

	has_one_attached in model
	string in migration



Use delegate :fields
use eager load with .include(:model, model: :inside_model)

passowrd

	bcrypt install
	email:uniq password:digest
	has_secure_password
	user.authenticate(params[:password])



Acts as votable
	install acts_as_votable
	generate acts_as_votable:migration
	migrate
	acts_as_votable acts_as_voter


Font awesome
	yarn add 
	application.js import js/all

	environment.js


bootstrap from website reference can be taken
simple form with bootstrap

