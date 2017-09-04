class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  before_action :set_topic_item, only: [:edit, :show, :update]
  layout 'topic'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
  @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topic_path, 
        notice: 'Topic item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
     respond_to do |format|
       format.html { redirect_to topics_url, 
       notice: 'Topic was successfully destroyed.' }
     end
  end
  
  private
  
  def topic_params
      params.require(:topic).permit(:title)
  end
  
  def set_topic_item
    @topic = Topic.find(params[:id])
  end
   
  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
