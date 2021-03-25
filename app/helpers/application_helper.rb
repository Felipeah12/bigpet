# frozen_string_literal: true

module ApplicationHelper
  def title_app
    I18n.t('app')
  end

  def view_active?(controller)
    params[:controller] == controller ? 'active' : nil
  end

  def devise_active?
    params[:controller].include?('devise') ? 'active' : nil
  end

  def size_types
    Pet.size_types
  end

  def kind_of_pets
    Pet.kind_of_pets
  end

  def genders
    Pet.genders
  end

  def enum_size(key)
    I18n.t("size_type.#{key}")
  end

  def enum_kind(key)
    I18n.t("kind_of_pet.#{key}")
  end

  def enum_gender(key)
    I18n.t("gender.#{key}")
  end
end
