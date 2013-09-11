#!/bin/env ruby
# encoding: utf-8

class G::GalleriesController < G::BaseController

	def show
    unless @gallery = G::Gallery.find_by_group_id_and_id(current_group.try(:id), params[:id])
      render 'public/404'
    end
  end

end
