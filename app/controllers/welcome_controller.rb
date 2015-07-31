class WelcomeController < ApplicationController

  def data
    @organizations = Organization.all
    @people = Person.all
    @acquisitions = Acquisition.all
    @joins = Join.all
    @investments = Investment.all
  end
end
