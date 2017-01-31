trigger TestFileUpload2 on ContentDocument (before insert, After insert) {
    system.debug('@Test Debug@'+trigger.new);
}