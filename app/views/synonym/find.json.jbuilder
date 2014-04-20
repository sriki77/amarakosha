unless @syn.empty?
  json.synonyms @syn.each do |s|
    json.details s.details
    json.words s.words
  end
end