class Contact < ActiveHash::Base
  self.data = [
    { id: 0, name: 'Skype' },
    { id: 1, name: 'Discord' },
    { id: 2, name: 'InGameID' },
    { id: 4, name: 'Twitter' },
  ]
end
