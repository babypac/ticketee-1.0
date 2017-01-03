class UpdateForeignKey < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key :tickets, :projects
    remove_foreign_key :roles, :projects
    remove_foreign_key :comments, :tickets
    remove_foreign_key :attachments, :tickets
    remove_foreign_key :tickets, :states
    remove_foreign_key :comments, :states

    # add the new foreign_key
    add_foreign_key :tickets, :projects, on_delete: :cascade
    add_foreign_key :roles, :projects, on_delete: :cascade
    add_foreign_key :comments, :tickets, on_delete: :cascade
    add_foreign_key :attachments, :tickets, on_delete: :cascade
    add_foreign_key :tickets, :states, on_delete: :cascade
    add_foreign_key :comments, :states, on_delete: :cascade
  end
end
