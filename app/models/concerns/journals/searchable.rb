module Journals
  module Searchable
    extend ActiveSupport::Concern

    included do 
      def self.journal_search(query,choice)
        __elasticsearch__.search(
          {
            query: {
              multi_match: {
                query: query,
                type: "phrase_prefix",
                fields: field_search(choice)
              }
            }
          }
        )
      end

      def self.field_search(choice)
        case choice
        when "all"
          ['words']
        when "firstname"
          ['firstname']
        when "lastname"
          ['lastname']
        when "address"
          ['address']
        when "phone"
          ['phone']
        else
          ['firstname', 'lastname', 'address', 'phone']
        end
      end

      # def as_indexed_json(options={})
      #   as_json(
      #     only: [:firstname]
      #   )
      # end
    # end

      # def to_indexed_json
      #   {
      #     id: self.id,
      #     name: self.author,
      #     words: self.words,
      #     pdf: ( (!!self.pdf.path && File.exists?(self.pdf.path)) ? Base64.encode64(File.read(self.pdf.path)) : '' )
      #   }.to_json
      # end

      # def attachment
      #   if document.present?
      #     path_to_document = "#{RAILS_ROOT}/app/assets/#{document}"
      #     Base64.encode64(open(path_to_document) { |pdf| pdf.read})
      #   end
      # end

     end
  end
end

# Doc.__elasticsearch__.client.cluster.health
# Doc.__elasticsearch__.client = Elasticsearch::Client.new host: 'localhost'
# # # # Delete the previous Customers index in Elasticsearch
# Doc.__elasticsearch__.client.indices.delete index: Doc.index_name rescue nil

# # # Create the new index with the new mapping
# Doc.__elasticsearch__.client.indices.create \
#   index: Doc.index_name,
#   body: { settings: Doc.settings.to_hash, mappings: Doc.mappings.to_hash }

# Doc.import