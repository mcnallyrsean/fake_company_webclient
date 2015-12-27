class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by(id: params[:id])
  end

  def new
  end

  def create
    @company = Company.create(
        name: params[:name],
        catchphrase: params[:catchphrase],
        buzzword: params[:buzzword],
        bs: params[:bs],
        hipster: params[:hipster]
        )
    redirect_to "/companies/#{@company.id}"
  end

  def edit
    @company = Company.find_by(id: params[:id])
    render :edit
  end

  def update
     @company = Company.update(
        name: params[:name],
        catchphrase: params[:catchphrase],
        buzzword: params[:buzzword],
        bs: params[:bs],
        hipster: params[:hipster]
        )
    redirect_to "/companies/#{id}"
  end

  def destroy
    @company = Company.find_by(id: params[:id])
    @company.destroy
    redirect_to "/companies"
  end
end

