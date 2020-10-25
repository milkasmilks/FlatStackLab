require 'pg'

class ToDo
	attr_reader :id, :title

	@@conn = PG.connect(dbname: 'todo_app', host: 'localhost', user: 'postgres',
    password: '12345')


  def initialize(params)
  	@id = params['id']
   	@title = params['title']
  end


  def save()
  	@@conn.exec( "INSERT INTO todos (title) VALUES ('#{@title}') RETURNING id" )
  end

  def delete()
  	@@conn.exec( "DELETE FROM todos WHERE id=#{@id}" )
  end

  def update(title)
  	@@conn.exec( "UPDATE todos SET title='#{title}' WHERE id=#{@id}" )
  end

  def self.where(params)
  	if (params['id'] == nil)
  		@@conn.exec( "SELECT * FROM todos WHERE title='#{params['title']}'" )
  	else
  		@@conn.exec( "SELECT * FROM todos WHERE id=#{params['id']}" )
  	end
  end

  def self.all
  	@@conn.exec( "SELECT * FROM todos" )
  end

end
