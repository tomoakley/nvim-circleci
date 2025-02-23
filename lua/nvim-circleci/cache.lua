local cache = {}

cache.workflowData = {}

cache.workflowJobs = {}

cache.findWorkflowById = function(id)
    for _, item in ipairs(cache.workflowData) do
        if item.id == id then
            return item
        end
    end
    return nil
end

cache.getCachedWorkflowForId = function(id)
  local cachedWorkflow = cache.findWorkflowById(id)
  if cachedWorkflow and cachedWorkflow.status == "success" then
    return cachedWorkflow
  end
end

cache.getCachedJobsForWorkflowId = function(id)
  local cachedWorkflow = cache.findWorkflowById(id)
  if cachedWorkflow and cachedWorkflow.status == "success" then
    local cachedJobs = cache.workflowJobs[id]
    if cachedJobs then
      return cachedJobs
    end
  end
end

return cache
