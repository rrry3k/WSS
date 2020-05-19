#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'json'

get('/') do
	File.read('start.html')
end

get('/log') do
	send_file 'WSReceived.txt'
end

post '/' do
  values = JSON.parse(request.env["rack.input"].read)
  File.open('Patch_Req.txt', 'a+') { |file| file.puts('-----------------------')}
  File.open('Patch_Req.txt', 'a+') { |file| file.write(Time.now) }
  File.open('Patch_Req.txt', 'a+') { |file| file.write(' ==> ') }
  File.open('Patch_Req.txt', 'a+') { |file| file.puts(values) }
end

patch '/' do
  values = JSON.parse(request.env["rack.input"].read)
  File.open('WSReceived.txt', 'a+') { |file| file.puts('-----------------------')}
  File.open('WSReceived.txt', 'a+') { |file| file.puts(Time.now) }
  File.open('WSReceived.txt', 'a+') { |file| file.puts(env.headers) }
  File.open('WSReceived.txt', 'a+') { |file| file.puts(values) }
end

delete '/' do
 # values = JSON.parse(request.env["rack.input"].read)
 # File.open('WSDelete.txt', 'a+') { |file| file.puts('-----------------------')}
  #File.open('WSDelete.txt', 'a+') { |file| file.puts(Time.now) }
  #File.open('WSDelete.txt', 'a+') { |file| file.puts(env.headers) }
  File.open('WSDelete.txt', 'a+') { |file| file.puts(values) }
end