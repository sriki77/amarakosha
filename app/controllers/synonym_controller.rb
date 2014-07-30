class SynonymController < ApplicationController
  before_filter :load_ref_data
  before_filter :authorize, :except => :find

  def find
    @syn=Array.new;
    params.permit(:w,:format)
    word=params[:w]
    unless word.blank?
      syn_candidates = @allSynonyms.find_all { |s| s.words.include? word }
      syn_candidates.each {|s|
      @syn << s if s.words.split(',').any?{|w| w.strip==word.strip}
      }
    end
    respond_to do |f|
      f.json
      f.any { render :text => "Only JSON format supported" }
    end
  end

  def index
    @syn=Synonym.all
  end

  def show
    @syn= Synonym.find(params[:id])
  end

  def new
  end

  def edit
    @syn= Synonym.find(params[:id])
  end

  def update
    synonym_params
    @syn= Synonym.find(params[:id])
    @syn.update!(synonym_params)
    redirect_to @syn
  end

  def create
    @syn = Synonym.new(synonym_params)
    @syn.save!
    redirect_to @syn
  end

  def destroy
    @syn= Synonym.find(params[:id])
    @syn.destroy!
    redirect_to synonym_index_url
  end

  private

  def synonym_params
    params[:synonym].permit(:details, :words, :shloka)
  end
end
