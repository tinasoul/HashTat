When a user tweets a photo to #hashtat
  - a new instance of the tattoo model should be created
  - that tattoo should be associated with the user who created, if they exist
  - if they don't exist as a user yet, they should only be prompted to login if they click on the show view for a tattoo, and then User.new/create would be called


    Download image from twitter to public/tattoos
If this is succesful, upload image to s3 using carrierwave
if that is also successful, delete image from public/tattoos