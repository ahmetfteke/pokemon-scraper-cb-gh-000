class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize params = {}
    params.each { |key, value| send "#{key}=", value }
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).each do |row|
      return Pokemon.new(id: row[0], name: row[1], type: row[2])
    end
  end
end
