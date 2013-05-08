#!/bin/env ruby
# encoding: utf-8

class SessionsController < ApplicationController

	def plus
	end

	def login
	end

	def create
		params[:session][:name] = params[:session][:name].gsub(/\s+/, "").downcase
		user = User.find_by_name(params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			params[:session][:remember_me] == '1' ? sign_in_permanent(user) : sign_in(user)
			respond_to do |format|
      	format.html { redirect_to(root_path, notice: "Connexion réussie.") }
      	format.js { render 'create_success' }
    	end
		else
			flash.now[:error] = "Nom d'utilisateur ou/et mot de passe incorrect."
			respond_to do |format|
      	format.html { render 'login' }
      	format.js { render 'create_error' }
    	end
		end
	end

	def destroy 
		sign_out
		redirect_to root_path, notice: "Déconnection réussie."
	end
end
