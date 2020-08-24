class ImagePostMailer < ApplicationMailer
    def image_post_mail(image_post)
        @image_post = image_post
        mail to: "richardfromsv@gmail.com", subject: "Posting Successful!"
    end
end
