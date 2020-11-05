class RelationshipsController < ApplicationController
    def create
        
        redirect_to request.referer
    end

    def destroy

        redirect_to request.referer
        
    end
    
    
end
