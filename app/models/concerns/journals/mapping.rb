module Journals
  module Mapping
    extend ActiveSupport::Concern
      included do
      index_name "#{Rails.env}_journals"
      mapping do
          indexes :id, index: :not_analyzed
          indexes :name,  boost: 9
          indexes :pdf
          indexes :words, boost: 10
          indexes :year
          indexes :author,  boost: 8
          # indexes :coordinates, type: 'geo_point'
          # indexes :company_number
          # indexes :main_phone_number, type: 'string',  index: :not_analyzed
          # indexes :market_name,  type: 'string'
          # indexes :opening_hours, type: 'nested' do
          #   indexes :periods, type: 'string'
          #   indexes :open_now, type: 'string'
          #   indexes :weekday_text, type: 'string'
          # end
          # indexes :rating
          # indexes :tags_with_score, type: 'nested' do
          #   indexes :name,  type: 'string'
          #   indexes :score, type: 'float'
          # end
          # indexes :tag_names,    type: 'string'
          # indexes :region_names, type: 'string'
          # indexes :site_ids,     type: 'integer', index: :not_analyzed
          # indexes :region_ids,   type: 'integer', index: :not_analyzed
          # indexes :category_ids, type: 'integer', index: :not_analyzed
          # indexes :tag_ids,      type: 'integer', index: :not_analyzed
      end
    end
  end
end
