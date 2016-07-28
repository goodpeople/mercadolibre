module Mercadolibre
  module Entity
    class Brand
      def self.attr_list
        [:tags, :fantasy_name, :status, :pictures, :type, :official_store_id, :categories_ids, :site_id, :name, :date_created, :boost, :return_policy, :relevance_position]
      end

      attr_reader *attr_list

      def initialize(attributes={})
        attributes.each do |k, v|
          if k.to_s == 'pictures'
            self.pictures = v.map { |x| BrandPicture.new(x) } unless v.nil?
          elsif k.to_s == 'date_created'
            self.date_created = Time.parse(v) unless v.nil?
          else
            self.send("#{k}=", v) if self.respond_to?(k)
          end
        end
      end

      private

      attr_writer *attr_list
    end
  end
end


