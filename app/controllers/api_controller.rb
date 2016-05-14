require 'uri'
require 'net/http'
require 'json'
class ApiController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def contar_post_api(tag)
		token = '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'	
		#tag = params[:tag]
		url = URI("https://api.instagram.com/v1/tags/"+ tag +"?access_token=" + token)
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url)
		request["content-type"] = 'application/json'
		request["cache-control"] = 'no-cache'
		request["postman-token"] = 'a6719103-e787-baf6-90db-0618b6f3da85'
		response = http.request(request)
		response_json = JSON.parse(response.body)
		variable = response_json["data"]["media_count"]
		return variable
		#otro_json = {:total => @variable}
		#respuesta_json = {:metadata => otro_json, :idoc => 'jiji'}.to_json
		#my_hash = JSON.parse(respuesta_json)
		#respond_to do |format|
		#  format.html {}
		#  format.json { render :json => my_hash}
		#  format.js
		#end	
	end

	def obtener_post_api
		token = '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
		post_num = 20
		objetos = []
		tag = params[:tag]
		url = URI("https://api.instagram.com/v1/tags/"+ tag +"/media/recent?access_token=" + token)
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url)
		request["content-type"] = 'application/json'
		request["cache-control"] = 'no-cache'
		request["postman-token"] = 'a6719103-e787-baf6-90db-0618b6f3da85'
		response = http.request(request)
		response_json = JSON.parse(response.body)
		for i in 0..2
			tag_post = response_json["data"][i]["tags"]
			username_post = response_json["data"][i]["user"]["username"]
			likes_post = response_json["data"][i]["likes"]["count"]
			image_post = response_json["data"][i]["images"]["standard_resolution"]["url"]
			caption_post = response_json["data"][i]["caption"]["text"]
			post_json = Hash.new
			post_json = {:tags => tag_post, :username => username_post, :likes => likes_post, :url => image_post, :caption => caption_post}
			objetos.push(post_json)
		end
		#puts objetos
		@num_posts = contar_post_api(tag)
		meta_json = {:total => @num_posts}
		respuesta_json = {:metadata => meta_json, :posts => objetos}.to_json
		my_hash = JSON.parse(respuesta_json)
		respond_to do |format|
		  format.html {}
		  format.json { render :json => my_hash}
		  format.js
		end	
	end

	def home
		render text: "otra ruta"
	end
end
