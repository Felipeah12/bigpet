# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show destroy]
  before_action :find_contact, only: %i[show destroy]

  def index
    @contacts = Contact.sort_created_at
  end

  def new
    @contact = Contact.new
  end

  def show; end

  def create
    @contact = Contact.new(contact_parameters)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to new_contact_path, notice: I18n.t('successful_contact') }
        format.json { render :new, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_path, notice: 'Contacto eliminado exitosamente!' }
      format.json { head :no_content }
    end
  end

  private

  def contact_parameters
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

  def find_contact
    @contact = Contact.find_by!(id: params[:id])
  end
end
