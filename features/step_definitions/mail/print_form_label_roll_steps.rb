
# common steps for Labels and Rolls

Then /^[Cc]lick Print form Edit Customs Form [Bb]utton$/ do
  step "blur out on print form"
  stamps.mail.print_form.mail_customs.edit_form
end
