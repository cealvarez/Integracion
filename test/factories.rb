#   Factory.define :user do |f|
#     f.login 'johndoe%d'                          # Sequence.
#     f.email '%{login}@example.com'               # Interpolate.
#     f.password f.password_confirmation('foobar') # Chain.
#   end

#   Factory.define :post do |f|
#     f.user { Factory :user }                     # Blocks, if you must.
#   end
