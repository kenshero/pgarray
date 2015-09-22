class Doc < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Journals::Searchable
  include Journals::Mapping
  
  has_attached_file :pdf, styles: { pdf_thumbnail: ["60x60#", :jpg] }
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  # has_attached_file :pdf,
  #   :styles => { pdf_thumbnail: ["60x60#", :jpg] },
  #   :storage => :s3,
  #   :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  #   :url =>':s3_domain_url',
  #   :path => '/:class/:attachment/:id_partition/:style/:filename'

  # validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  #   def s3_credentials
  #     {:bucket => "xxxxx", 
  #      :access_key_id => "xxxxxxxxx",
  #      :secret_access_key => "xxxxxxxxxxxx"
  #     }
  #   end

  before_create :cut_whitespace
  before_update :cut_whitespace
  # before_validation :edit_tag
  # after_initialize :cut_tag

  # def separate_tag
  #   input_words = self.words
  #   word_split = input_words[0].split(',')
  #   # puts "#{tags}"
  #   self.words = word_split
  #   puts self.inspect
  # end

  def cut_whitespace
    # puts self.inspect
    # puts self.image.inspect

    # response = HTTParty.post("http://localhost:9000/upload",
    # :query => { :pdf => self.image })

    # puts response
    # error
    input_words = self.words
    input_words.delete_if {|word| word == "" }
  end

end
