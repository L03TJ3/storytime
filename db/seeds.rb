tags = [
  "love",
  "war",
  "heart",
  "guns",
  "beauty",
  "religious",
  "art",
  "fantasy",
  "memories",
  "animal",
  "journey",
  "family",
  "marriage",
  "celebration",
  "grief",
  "hope",
  "diamond",
  "regret",
  "poem",
  "painting",
  "tears",
]

tags.each do | tag_name |
  tag = Tag.create( name: tag_name)
end
