guard('rake', task: 'default') do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/) { |match| "spec/#{match[1]}_spec.rb" }
end
