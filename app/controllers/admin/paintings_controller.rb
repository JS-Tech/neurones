#!/bin/env ruby
# encoding: utf-8

class Admin::PaintingsController < Admin::BaseController
  before_filter only: [:destroy] {|controller| controller.modify_right(Painting)}
	before_filter :find_gallery

  def new
  	@painting = Painting.new
  end

  def create
  	@painting = @gallery.paintings.new(params[:painting])
    unless @painting.save
      render nothing: true, status: 415
    end
  end

  def destroy
  	@painting = Painting.find(params[:id])
    @painting.remove_image!
    @painting.destroy
    flash[:success] = "Photo supprimée"
    redirect_to edit_admin_gallery_path(@gallery)
  end

  private

  def find_gallery
  	@gallery = Gallery.find(params[:gallery_id])
  end
end
