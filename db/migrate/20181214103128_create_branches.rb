class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name, null: false, index: { unique: true }, comment: "Имя ветви"
      t.string :slug, null: false, index: { unique: true }, comment: "Плашка ветви"
      t.integer :srpms_count, default: 0, comment: "Счётчик уникальных исходных пакетов для ветви"

      t.timestamps
    end
  end
end
