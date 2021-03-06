class Thought < ActiveRecord::Base
    belongs_to :user

    validates :description, presence: true

    ratyrate_rateable 'quality'

    has_attached_file :image,
                      :styles => { :medium => '300x300>', :thumb => '100x100>' },
                      :default_url => 'missing_:style.png'

    validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

    acts_as_taggable
    acts_as_taggable_on :tag_list
end
