class GroupsController < ApplicationController
  # before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])
  end

  def landing_page
    @groups = Group.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Group successfully added!"
      redirect_to groups_path
    else
      flash[:alert] = "Group Not successfully added!"
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name, :genre)
    end
end
