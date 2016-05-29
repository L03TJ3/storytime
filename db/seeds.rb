tags = [
  "Love",
  "War",
  "Heart",
  "Guns",
  "Beauty",
  "Religious",
  "Art",
  "Fantasy",
  "Memories",
  "Animal",
  "Journey",
  "Family",
  "Conflict",
  "Celebration",
  "Grief",
  "Hope",
  "Diamond",
  "Regret",
  "Loneliness",
  "Painting",
  "Tears",
]

tags.each do | tag_name |
  tag = Tag.create( name: tag_name)
end
