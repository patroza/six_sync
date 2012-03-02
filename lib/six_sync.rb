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

require "six_sync/version"

module SixSync

  autoload :Checksum, "six_sync/checksum.rb"

  autoload :File, "six_sync/file.rb"
  autoload :PackFile, "six_sync/file.rb"
  autoload :WdFile, "six_sync/file.rb"

  autoload :Remote, "six_sync/remote.rb"

  autoload :Repository, "six_sync/repository.rb"
end
