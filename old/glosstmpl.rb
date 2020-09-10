#!/usr/bin/env ruby
#
require "byebug"
require 'csv'

CSV.foreach('glossary.csv', headers: true) do |row|
      glossterm = row['glossterm']
      glossdef = row['glossdef']
      glosssee = row['glosssee']
      glossseealso = row['glossseealso']

   puts <<EOF
<glossentry id="#{glossterm}"><glossterm>#{glossterm}</glossterm>
  <glossdef>
    <para>#{glossdef}</para>
    <glosssee otherterm="#{glosssee}">#{glosssee}</glosssee>
    <glossseealso otherterm="#{glossseealso}">#{glossseealso}</glossseealso>
  </glossdef>
</glossentry>
EOF
  end
