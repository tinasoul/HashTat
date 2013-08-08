When a user tweets a photo to #hashtat
  - a new instance of the tattoo model should be created
  - that tattoo should be associated with the user who created, if they exist
  - if they don't exist as a user yet, they should only be prompted to login if they click on the show view for a tattoo, and then User.new/create would be called
  