json.organizations @organizations, :name, :id
json.people @people, :name, :id
json.acquisitions @acquisitions, :parent_id, :child_id, :amount
json.joins @joins, :company_id, :person_id
json.investments @investments, :investor_id, :investee_id, :amount, :investor_type