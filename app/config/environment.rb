# frozen_string_literal: true

require 'dotenv/load'

require_relative '../lib/apis/github_api'
require_relative '../lib/apis/gitlab_api'
require_relative '../lib/apis/timeout_error'
require_relative '../lib/models/repository_collection'
