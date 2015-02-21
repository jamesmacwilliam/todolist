# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.create([
  {email: 'test@thing.com'}
])

Project.create([
  { user_id: 1, title: "stuff", note: "this is a string of chars", 
    completed: false, created_at: "2014-07-06 19:18:40", updated_at: "2014-07-06 22:44:17"}, 
  { user_id: 1, title: "another", note: "right on", 
    completed: false, created_at: "2014-07-10 19:18:40", updated_at: "2014-07-10 22:44:17"}
  ])

Task.create([
  { project_id: 1, title: "stuff to do!", note: "stuff and things", completed: false, 
    created_at: "2014-07-06 22:13:22", updated_at: "2014-07-09 01:28:12"
  },
  { project_id: 2, title: "gah! i'm so stressed!", note: "dudez, i got this", completed: true, 
    created_at: "2014-07-06 22:13:22", updated_at: "2014-07-09 01:28:12"
  }
])

