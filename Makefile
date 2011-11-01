#===================================================================
#--------------------------- Variables -----------------------------
#===================================================================
npmbin = node_modules/.bin

#===================================================================
#­--------------------------- TARGETS ------------------------------
#===================================================================
.PHONY : clean deps spec

#-------------------------------------------------------------------
# BUILD
#------------------------------------------------------------------- 

#-------------------------------------------------------------------
# TEST
#------------------------------------------------------------------- 
spec: deps
	for i in $$(ls spec/*.spec.coffee); do \
		echo "---- $$i ----"; \
		node_modules/.bin/jasmine-node --coffee "$$i"; \
	done
	#TODO: Figure out how to prevent node_redis from reconnecting,
	#      causing an error at the end LogPublisher, and borking
	#      jasmin-node from continuing on.
	# node_modules/.bin/jasmine-node --coffee spec/

#-------------------------------------------------------------------
# DEV 
#------------------------------------------------------------------- 

#-------------------------------------------------------------------
# Dependencies 
#------------------------------------------------------------------- 
deps:
	npm install

clean: 
