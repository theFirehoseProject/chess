class StaticPagesController < ApplicationController
	def index
	FIREBASE.push("secondFireItem", { :name => "two", :priority => 2 })
	end


	
end
