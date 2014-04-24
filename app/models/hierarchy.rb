# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Hierarchy
  ## args => active_record_relation or array of objects
    def self.set(args)
      parents = get_parents(args)
      make_tree(parents, args) if parents.present?
    end      
      
    def self.get_parents(args)
      args.select{|arg| arg.parent_id.blank?}
    end
    
    def self.make_tree(parents, args)
      mash_hs = {}
      parents.each do |parent|
        mash_hs[parent] = args.select{|child| child.parent_id==parent.id}
      end
      mash_hs
    end
end

  
#        mash_hs = {}
#      parents.each do |parent|
#        mash_hs[parent.id] = parent.attributes
#        mash_hs[parent.id][:child] = args.select{|child| child.parent_id == parent.id}.map{|child| child.attributes}
#      end
#      mash_hs 
