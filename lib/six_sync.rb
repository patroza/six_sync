=begin
  Copyright:   Copyright (C) 2011-2012 Patrick Roza. All rights reserved.
  Website:     http://www.six-updater.net
  Author:      Patrick Roza
  E-mail:      sb@dev-heaven.net

  The copyright to the source code and computer program(s) herein is the property of Patrick Roza, The Netherlands.
  The source code and program(s) may be used and/or copied only with the written permission of Patrick Roza or in
  accordance with the terms and conditions stipulated in the agreement/contract under which the source code and
  program(s) have been supplied.
=end

require_relative "six_sync/version"

# SixSync is a library for distributing and managing repositories of files,
# Leveraging rSync and zSync for differential transfers
# Primarily intended for the distribution of Modifications for Games.
module SixSync

  autoload :Archiver, "six_sync/archiver"
  autoload :Zip7Archiver, "six_sync/archiver"
  autoload :GzipArchiver, "six_sync/archiver"

  autoload :Checksum, "six_sync/checksum"
  autoload :Md5Checksum, "six_sync/checksum"
  autoload :Sha1Checksum, "six_sync/checksum"

  autoload :Configuration, "six_sync/configuration"

  autoload :File, "six_sync/file"
  autoload :PackFile, "six_sync/file"
  autoload :WdFile, "six_sync/file"

  autoload :Network, "six_sync/network"

  autoload :Options, "six_sync/options"
  autoload :NetworkOptions, "six_sync/options"

  autoload :Remote, "six_sync/remote"

  autoload :Repository, "six_sync/repository"

  module_function

  # Retrieve full product version string
  def product_version
    "SixSync version #{VERSION}"
  end

  # Finds the klass in our namespace
  # @param [Symbol] klass Class to lookup
  # @param [Symbol] trailing Specify type of class
  def find_klass klass, trailing = nil
    const_get "#{klass.to_s.capitalize}#{trailing.nil? ? nil : "#{trailing.to_s.capitalize}"}"
  end
end
