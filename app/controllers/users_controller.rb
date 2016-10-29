def show
  @survey = Survey.find(params[:id])
end
