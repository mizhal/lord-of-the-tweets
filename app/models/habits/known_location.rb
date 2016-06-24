class Habits::KnownLocation
  
  include Mongoid::Document
  include Mongoid::Geospatial

  field :state
  field :province
  field :city_or_district

  field :location, :type: Point
  
  ## INDEXES
  spatial_index :location
  ## END: INDEXES
  
end
