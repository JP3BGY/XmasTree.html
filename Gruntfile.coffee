module.exports = (grunt) ->
	grunt.initConfig
		watch:
			options:
				livereload:true
			dist:
				files:['dist/**/*.html']
				tasks:'htmlmin'
			coffee:
				tasks:'coffee'
				files:['coffee/**/*.coffee']
			compass:
				tasks:'compass'
				files:['sass/**/*.sass']
			haml:
				tasks:'haml'
				files:['haml/**/*.haml']
		connect:
			server:
				options:
					port:9000
					base:'./'
		coffee:
			compile:
				files:[
					expand: true,
					cwd:'coffee/',
					src:['**/*.coffee']
					dest:'js/'
					ext:'.js'
				]
		compass:
			dist:
				options:
					config: './config.rb'
					sassDir: 'sass'
					cssDir: 'css'

		haml:
			compile:
				files:[
					expand: true,
					cwd:'haml/',
					src:['**/*.haml'],
					dest:'dist/',
					ext:'.html'
				]
		htmlmin:
			dist:
				options:
					removeComments: true
					collapseWhitespace: true
				files:[
					expand: true
					cwd:'dist/'
					src:['**/*.html']
					dest:'./'
					ext:'.html'
				]


			
	grunt.loadNpmTasks "grunt-contrib"
	grunt.loadNpmTasks "grunt-contrib-sass"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-compass"
	grunt.loadNpmTasks "grunt-contrib-haml"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-contrib-connect"
	grunt.registerTask "default",["connect","watch"]
