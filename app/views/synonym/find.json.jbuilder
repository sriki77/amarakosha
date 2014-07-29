if  @syn && !@syn.empty?
  json.synonyms @syn.each do |s|
    json.details s.details
    json.words s.words
    json.shloka s.shloka
  end
end