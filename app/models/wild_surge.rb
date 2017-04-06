class WildSurge
  def initialize
    @surges = JSON.parse(File.read('app/models/surges.json'))
  end

  def find_by_id(id)
    id = id.to_i.to_s.rjust(4, '0')
    @surges[id.to_s] || "Could not find a surge with the ID of #{id.to_s}"
  end

  def self.find_by_id(id)
    self.new.find_by_id(id)
  end
end