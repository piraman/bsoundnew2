module.exports = (grunt) ->

	grunt.initConfig
		jade:
			options:
				pretty: yes
			compile:
				expand: yes
				cwd: './'
				src: [
					'./public/**/*.jade'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
				]
				dest: './'
				ext: '.html'
				extDot: 'last'
		stylus:
			options:
				compress: no
			compile:
				expand: yes
				cwd: './'
				src: [
					'./public/**/*.styl'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
				]
				dest: './'
				ext: '.css'
				extDot: 'last'
		coffee:
			options:
				bare: no
			compile:
				expand: yes
				cwd: './'
				src: [
					'./**/*.coffee'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
					'!./gruntfile.coffee']
				dest: './'
				ext: '.js'
				extDot: 'last'
		watch:
			options:
				livereload:
					port: 10100
			jade:
				files: [
					'./public/**/*.jade'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
				]
				tasks: ['newer:jade']
			stylus:
				files: [
					'./public/**/*.styl'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
				]
				tasks: ['newer:stylus']
			coffee:
				files: [
					'./**/*.coffee'
					'!./public/**/bower_components/**'
					'!./node_modules/**'
					'!./gruntfile.coffee'
				]
				tasks: ['newer:coffee']

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-newer'

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee', 'watch']