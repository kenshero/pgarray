class Doc < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Journals::Searchable
  include Journals::Mapping
  
  # has_attached_file :pdf, styles: {thumbnail: "60x60#"}
  # validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  has_attached_file :pdf,
    :styles => { thumbnail: "60x60#" },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    :url =>':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename'

  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

    def s3_credentials
      {:bucket => "xxxxxxxx", 
       :access_key_id => "xxxxxxxx",
       :secret_access_key => "xxxxxxxx"
      }
    end

  before_create  :separate_tag
  before_validation :edit_tag
  # after_initialize :cut_tag

  def separate_tag
    input_words = self.words
    word_split = input_words[0].split(',')
    # puts "#{tags}"
    self.words = word_split
    puts self.inspect
  end

  def edit_tag
    puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
  end

end
